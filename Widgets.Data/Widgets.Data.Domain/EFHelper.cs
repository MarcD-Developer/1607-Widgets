using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Widgets.Data.Domain
{
    public class EFHelper
    {
        private readonly widgetsDBEntities db;
        public EFHelper()
        {
            db = new widgetsDBEntities();
        }

        public EFHelper(widgetsDBEntities db)
        {
            this.db = db;
        }

        #region GetWidgets

        /// <summary>
        /// Returns a list of widgets
        /// 
        /// </summary>

        public List<Widget> GetWidgets()
        {
            return db.Widgets.ToList();
        }

        public List<State> GetStates()
        {
            return db.States.ToList();
        }

        public List<Tax> GetTaxes()
        {
            return db.Taxes.ToList();
        }

        #endregion

        #region InsertWidgets

        ///<summary>
        ///
        /// Insert widget into database
        /// 
        /// </summary>

        public bool InsertWidget(Widget widg)
        {
            widg.Active = true;
            try
            {
                db.Widgets.Add(widg);
                if(db.SaveChanges() == 0)
                {
                    return false;
                }
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool InsertState(State st)
        {
            st.Active = true;
            try
            {
                db.States.Add(st);
                if(db.SaveChanges() == 0)
                {
                    return false;
                }
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool InsertTax(Tax tx)
        {
            try
            {
                db.Taxes.Add(tx);
                if (db.SaveChanges() == 0)
                {
                    return false;
                }
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        #endregion

        #region UpdateWidgets


        #endregion
    }
}
